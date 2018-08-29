{ stdenv, makeWrapper, lib, fetchFromGitHub, glibcLocales
, seth, curl, jshon, bc, gnused, which, perl
, setzer
}:

stdenv.mkDerivation rec {
  name = "terra-${version}";
  version = "0.1.1";
  src = ./.;

  nativeBuildInputs = [makeWrapper];
  buildPhase = "true";
  makeFlags = ["prefix=$(out)"];
  postInstall = let path = lib.makeBinPath [
    seth curl jshon bc gnused which perl setzer
  ]; in ''
    wrapProgram "$out/bin/terra" --prefix PATH : "${path}" \
      ${if glibcLocales != null then
        "--set LOCALE_ARCHIVE \"${glibcLocales}\"/lib/locale/locale-archive"
        else ""}
  '';

  meta = with lib; {
    description = "Price feed oracle";
    homepage = https://github.com/makerdao/terra;
    license = licenses.gpl3;
    inherit version;
  };
}
