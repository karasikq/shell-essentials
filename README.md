# Just useful scripts

 - [analyze_space.sh](./analyze_space.sh) - print files size recursively with threshold. -h to more
 - [repair_grub_fedora.sh](./repair_grub_fedora.sh) - repair grub from Live iso
 - [sized-file.sh](./sized_file.sh) - create file with specified size. -h to more
 - [start-llm.sh](./start_llm.sh) - starts [ollama](https://github.com/ollama/ollama) and [anything-llm](https://github.com/Mintplex-Labs/anything-llm). Need to be preinstalled
 ## Unity scripts
 - [extract_build_log.sh](./unity/build_analyze/extract_build_log.sh) - extract build output from Editor.log (*1)
 - [analyze_build_logs.sh](./unity/build_analyze/analyze_build_logs.sh) - sort extracted logs (*1)
 - [auto_analyze.sh](./unity/build_analyze/auto_analyze.sh) - extract build output from Editor.log and sort it
 - [settings.sh](./unity/build_analyze/settings.sh) - settings for auto-analyze
 Note: settings.sh should be in same directory with other analyze scripts
 *1 run without arguments to usage help
