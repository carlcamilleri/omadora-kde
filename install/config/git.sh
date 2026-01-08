# Set identification from install inputs
if [[ -n "${OMADORA_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMADORA_USER_NAME"
fi

if [[ -n "${OMADORA_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMADORA_USER_EMAIL"
fi
