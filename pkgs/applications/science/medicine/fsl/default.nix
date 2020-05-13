{ stdenv, fetchurl }:

let version = "6.0.3"; in

stdenv.mkDerivation {
  name = "fsl-${version}-1";

  #builder = ./builder.sh;

  src = fetchurl {
    url = "https://fsl.fmrib.ox.ac.uk/fsldownloads/fsl-${version}-centos6_64.tar.gz";
    sha256 = "1v0k5ry0parbhrljcczg8j4l9n6yiqwa5fd9wp48wlic7jkimxms";
  };

  dontConfigure = true;

  dontBuild = true; 

  installPhase = ''
    mkdir $out
    cp -r * $out
    rm -rf $out/src
  '';

  meta = {
    description = "FMRIB Software Library, analysis tools for brain imaging data";
    homepage = "https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL";
  };
}
