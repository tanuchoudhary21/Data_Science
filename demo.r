# Save username as variable
username <- 'tanuchoudhary21'

# Save base enpoint as variable
url_git <- 'https://api.github.com/'

# Construct API request
repos <- GET(url = paste0(url_git,'users/',username,'/Data_Science'))

# Examine response components
names(repos)
status_code(repos)

# Process API request content 
repo_content <- content(repos)

# Apply function across all list elements to extract the name and address of each repo
repo_df <- lapply(repo_content, function(x) {
  df <-  data_frame(   repo       = x$name,
                   address     = x$html_url,
                   commits     = x$git_commits_url)
}) %>% bind_rows()

# Repo URL
url_repo <- repo_df$commits[repo_df$repo=='Data_Science']

# clean URL for proper format...
url_repo <- gsub(url_repo, pattern = 'git/commits{/Data_Science}', replacement = 'commits', fixed = TRUE)

# API request
commits <- GET(url = url_repo)

# List elements
names(commits)

# Status 
print(paste0('Status code: ', status_code(commits)))

# Get content
commits_content <- content(commits)

commits_df <- fromJSON(txt = url_repo)
glimpse(commits_df)
