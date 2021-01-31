self: super: {
  firefox-bin-unwrapped = super.firefox-bin-unwrapped.overrideAttrs(_: rec{
    version = "85.0";
    name = "firefox-85";
    src = super.fetchurl {
      url = "http://archive.mozilla.org/pub/firefox/releases/85.0/linux-x86_64/en-US/firefox-85.0.tar.bz2";
      sha256 = "sha256-rd8uQJTUsfTURFFlofUvvSGYzeX8nCE67xFFv+j//vI=";
    };
  });
}
