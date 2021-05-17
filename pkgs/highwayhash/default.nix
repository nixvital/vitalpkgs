{ lib, stdenv, cmake, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "highwayhash";
  version = "1.0";
  
  src = fetchFromGitHub {
    owner = "breakds";
    repo = "highwayhash";
    rev = "a5bea248f1628924dfdf133358ed27b8d4b24549";
    sha256 = "sha256-3AawdydgD2v4ef9kskXIXzjZNACerkZ9AqEnqSqbDqM=";
  };

  nativeBuildInputs = [ cmake ];

  meta = with lib; {
    homepage = "https://github.com/google/highwayhash";
    description = ''
      Strong (well-distributed and unpredictable) hashes:

      Portable implementation of SipHash
      HighwayHash, a 5x faster SIMD hash with security claims
    '';
    platforms = with platforms; linux ++ darwin;
    licencse = licenses.asl2;
  };
}
