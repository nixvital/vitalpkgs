{ lib
, fetchPypi
, requests
, buildPythonPackage }:

buildPythonPackage rec {
  pname = "discord-webhook";
  version = "0.14.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-89Zg31csqqnCYh7dfoY0pw1tgpXOklbDZYODEkVwaaE=";
  };

  propagatedBuildInputs = [
    requests
  ];

  pythonImportsCheck = [
    "discord_webhook"
  ];

  meta = with lib; {
    description = "execute discord webhooks";
    homepage = "https://github.com/lovvskillz/python-discord-webhook";
    license = licenses.mit;
    maintainers = with maintainers; [ breakds ];
  };
}
