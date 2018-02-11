{ stdenv, makeWrapper, lib, fetchFromGitHub
, seth, curl, jshon, bc, gnused, which, perl
, setzer
}:

stdenv.mkDerivation rec {
  name = "terra-${version}";
  version = "0.1.0";
  src = ./.;

  nativeBuildInputs = [makeWrapper];
  buildPhase = "true";
  makeFlags = ["prefix=$(out)"];
  postInstall = let path = lib.makeBinPath [
    seth curl jshon bc gnused which perl datamash
  ]; in ''
    wrapProgram "$out/bin/terra" --prefix PATH : "${path}"
  '';

  meta = with lib; {
    description = "Price feed oracle";
    homepage = https://github.com/makerdao/terra;
    license = licenses.gpl3;
    inherit version;
  };
}
