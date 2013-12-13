function set_local_gemfile
  set -l gemfile (pwd)/Gemfile.local
  setenv BUNDLE_GEMFILE $gemfile
  echo "using '$gemfile'"
end
