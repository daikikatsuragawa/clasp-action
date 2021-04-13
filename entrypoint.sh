#!/bin/sh -l

CLASPRC=$(cat <<-END
    {
        "token": {
            "access_token": "$1",
            "refresh_token": "$3",
            "scope": "https://www.googleapis.com/auth/cloud-platform https://www.googleapis.com/auth/drive.file https://www.googleapis.com/auth/service.management https://www.googleapis.com/auth/script.deployments https://www.googleapis.com/auth/logging.read https://www.googleapis.com/auth/script.webapp.deploy https://www.googleapis.com/auth/userinfo.profile openid https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/script.projects https://www.googleapis.com/auth/drive.metadata.readonly",
            "token_type": "Bearer",
            "id_token": "$2"
        },
        "oauth2ClientSettings": {
            "clientId": "$4",
            "clientSecret": "$5",
            "redirectUri": "http://localhost"
        },
        "isLocalCreds": false
    }
END
)

echo $CLASPRC > ~/.clasprc.json

CLASP=$(cat <<-END
    {
        "scriptId": "$6"
    }
END
)

if [ -n "$7" ]; then
  if [ -e "$7" ]; then
    cd "$7"
  else
    echo "rootDir is invalid."
    exit 1
  fi
fi

echo $CLASP > .clasp.json

CLASPIGNORE=$(cat <<-END
    **/**
    !*.js
    !*.ts
    !*.html
    !appsscript.json
END
)

echo $CLASPIGNORE > .claspignore

if [ "$8" = "push" ]; then
  clasp push
elif  [ "$8" = "deploy" ]; then
  if [ -n "$9" ]; then
    clasp deploy --description "$9"
  else 
    clasp deploy
  fi
else
  echo "command is invalid."
  exit 1
fi
