self: super: {
  nathanlithia = {
    gallery-dl = super.callPackage ./packages/gallery-dl.nix {};
    yt-dlp = super.callPackage ./packages/yt-dlp.nix {};

    vdl = super.writeShellScriptBin "vdl" (builtins.readFile ./scripts/vdl.sh);
    mvdl = super.writeShellScriptBin "mvdl" (builtins.readFile ./scripts/mvdl.sh);
    mdl = super.writeShellScriptBin "mdl" (builtins.readFile ./scripts/mdl.sh);
    gdl = super.writeShellScriptBin "gdl" (builtins.readFile ./scripts/gdl.sh);

  };
}
