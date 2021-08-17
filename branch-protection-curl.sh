#!/bin/bash
#  https://docs.github.com/en/rest/reference/repos#update-branch-protection
#  preview header: application/vnd.github.luke-cage-preview+json


# TODO: required_pull_request_reviews isn't actually applying, likely an issue with the api itself
curl -X PUT \
-H 'Accept: application/vnd.github.v3.raw+json' \
-u $GITHUB_USERNAME:$GITHUB_TOKEN \
-d '{
    "required_pull_request_reviews": {
        "dismissal_restrictions": {},
        "dismiss_stale_reviews": false,
        "require_code_owner_reviews": true,
        "required_approving_review_count": 1
    },
    "restrictions": {
    "users": ["$ADMIN_USERNAME"],
    "teams": []
    },
    "required_status_checks": null,
    "enforce_admins": null,
    "required_pull_request_reviews": null
  }' \
"https://api.github.com/repos/$ORGANIZATION/$REPO/branches/main/protection"