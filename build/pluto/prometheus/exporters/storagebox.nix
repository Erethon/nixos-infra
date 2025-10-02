{ config, ... }:

{
  age.secrets.storagebox-exporter-token.file = ../../../secrets/storagebox-exporter-token.age;

  services.prometheus = {
    exporters.storagebox = {
      enable = true;
      tokenFile = config.age.secrets.storagebox-exporter-token.path;
    };

    scrapeConfigs = [
      {
        job_name = "storagebox";
        metrics_path = "/metrics";
        static_configs = [ { targets = [ "127.0.0.1:9509" ]; } ];
      }
    ];
  };
}
