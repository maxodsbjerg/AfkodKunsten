SMK_downloader <- function(dataframe){
  
  outputdir <- "../data/images/"
  print(getwd())
  
  if (!dir.exists("../data/")){
    dir.create("../data/")
  } else {
    print("Dir already exists!")
  }
  
  if (!dir.exists("../data/images/")){
    dir.create("../data/images/")
  } else {
    print("Dir already exists!")
  }
  
  for (i in 1:nrow(dataframe)) {
    id <- dataframe[i, "id"][[1]]
    thumb <- dataframe[i, "image_thumbnail"][[1]]
    
    img <- load.image(thumb)
    
    save.image(img, paste0("../data/images/", id, ".png"))
  }

  filenames <- tibble(filenames = list.files("../data/images/", full.names = TRUE)) %>% 
    mutate(id = str_replace(filenames, ".*\\/(\\d+_\\w+)\\.\\w+$", "\\1"))
  
    right_join(filenames, dataframe, by = "id")
}