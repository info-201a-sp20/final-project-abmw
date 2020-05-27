## Summary Information on Global Coffee Insights
get_col_info <- function(column_name, data_frame) %>%
  (select(data_frame, column_name))

    return(list(summarize(
      data_frame,
     )

  }
}
summ_info <- function(coffee_df){
  sapply(colnames(coffee_df), get_col_info, coffee_df)
}