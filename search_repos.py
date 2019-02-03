import requests
import sys
import webbrowser

GITHUB_URL = "https://api.github.com/search/repositories?q={query_string}&sort=stars"

class CustomException(Exception):
    pass


def get_repo_link(repo_name, language):
    query_string = repo_name
    if language:
        query_string = "+".join([repo_name, language])
    try:
        response = requests.get(GITHUB_URL.format(query_string=query_string)).json()
        return response["items"][0]['html_url']
    except requests.exceptions.BaseHTTPError:
        raise CustomException("Error in reaching github some error occurred")

def main(repo_name, language):
    try:
        repo_link = get_repo_link(repo_name, language)
        webbrowser.open_new_tab(repo_link)
    except webbrowser.Error:
        raise CustomException("Error in opening browser")


if __name__ == "__main__":
    repo_name = sys.argv[1]
    language = None
    if len(sys.argv) == 3:
        language = sys.argv[2]
    main(repo_name, language)
