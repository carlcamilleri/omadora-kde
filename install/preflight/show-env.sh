# Show installation environment variables
gum log --level info "Installation Environment:" 2>/dev/null || echo "Installation Environment:"

env | grep -E "^(OMADORA_ONLINE_INSTALL|OMADORA_USER_NAME|OMADORA_USER_EMAIL|USER|HOME|OMADORA_REPO|OMADORA_REF|OMADORA_PATH)=" | sort | while IFS= read -r var; do
  gum log --level info "  $var" 2>/dev/null || echo "  $var"
done
