{
  lib,
  fetchurl,
  nix-update-script,
  yt-dlp,
  python3Packages,
}:
python3Packages.buildPythonApplication {
  pname = "gallery-dl";
  version = "1.31.10";
  pyproject = true;
  src = fetchurl {
    url = "https://github.com/mikf/gallery-dl/releases/download/v1.31.10/gallery_dl-1.31.10.tar.gz";
    hash = "sha256-04fEFCnhTCZG7rEChb9Hd88O09po7j8u3LpQXz4Te7c=";
  };
  build-system = [ python3Packages.setuptools ];
  dependencies = [
    python3Packages.requests
    python3Packages.pysocks
    yt-dlp
  ];
  nativeCheckInputs = [ python3Packages.pytestCheckHook ];
  disabledTests = [
    # requires network access
    "test_init"
  ];
  disabledTestPaths = [
    # requires network access
    "test/test_results.py"
    "test/test_downloader.py"
    # incompatible with pytestCheckHook
    "test/test_ytdl.py"
  ];
  pythonImportsCheck = [ "gallery_dl" ];
  passthru.updateScript = nix-update-script { };
  meta = {
    changelog = "https://github.com/mikf/gallery-dl/blob/v1.31.10/CHANGELOG.md";
    description = "Command-line program to download image-galleries and -collections from several image hosting sites";
    homepage = "https://github.com/mikf/gallery-dl";
    license = lib.licenses.gpl2Only;
    mainProgram = "gallery-dl";
    maintainers = with lib.maintainers; [
      dawidsowa
      FlameFlag
      lucasew
    ];
  };
}
