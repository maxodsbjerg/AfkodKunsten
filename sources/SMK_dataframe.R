SMK_dataframe <- function(dataframe) {
  dataframe %>%
    mutate(title = map(titles, "title")) %>%
    mutate(title = map_chr(title, 1, .null = NA)) %>% 
    mutate(title_notes = map(titles, "notes")) %>%
    mutate(title_notes = map_chr(title_notes, 1, .null = NA)) %>%
    mutate(creator_1 = map(production, "creator")) %>%
    mutate(creator_1 = map_chr(creator_1, 1, .null = NA)) %>% 
    mutate(creator_1_gender = map(production, "creator_gender")) %>%
    mutate(creator_1_gender = map_chr(creator_1_gender, 1, .null = NA)) %>%
    mutate(creator_2 = map(production, "creator")) %>%
    mutate(creator_2 = map_chr(creator_2, 2, .null = NA)) %>%
    mutate(art_type = map(object_names, "name")) %>%
    mutate(art_type = map_chr(art_type, 1, .null = NA)) %>% 
    mutate(production_start = map(production_date, "start")) %>%
    mutate(production_start = map_chr(production_start, 1, .null = NA)) %>%
    mutate(acquisition_date_precision = acquisition_date_precision) %>% 
    mutate(production_end = map(production_date, "end")) %>%
    mutate(production_end = map_chr(production_end, 1, .null = NA)) %>%  
    mutate(image_url = image_native) %>% 
    mutate(has_image = has_image) %>%
    mutate(image_thumbnail = image_thumbnail) %>% 
    mutate(saturation = saturation) %>%
    mutate(suggested_bg_color = suggested_bg_color) %>%
    select(id, title,art_type, frontend_url, creator_1, creator_1_gender, creator_2, title_notes, production_start, production_end,image_native, image_thumbnail, saturation,suggested_bg_color, has_image, exhibitions, public_domain, rights)
}