{pkgs, config, ...}:
{
    programs.codex = {
        enable = true;
        settings = {
            model = "gpt-5";
            model_provider = "fox";
            model_reasoning_effort = "high";
            disable_response_storage = true;
            model_providers.fox = {
                fox = {
                    name = "fox";
                    base_url = "https://code.newcli.com/codex/v1";
                    wire_api = "responses";
                    requires_openai_auth = true;
                };
            };
        };
    };

}
