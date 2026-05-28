exampleFunctionName() {
	local cmd="$1"
 
	if [[ "$cmd" == "build" ]]; then
		shift
		dotnet build /p:NuGetAudit=false -v m "$@"
	elif [[ "$cmd" == "cd" ]]; then
		cd "$( (
			fdfind --max-depth 1 --type d . ~/project_root
		) | fzf)"
	elif [[ "$cmd" == "code" ]]; then
		selected_dir="$( (
			fdfind --max-depth 1 --type d . ~/project_root
		) | fzf)"
		if [[ -d $selected_dir ]]; then
			code $selected_dir
		fi
	elif [[ "$cmd" == "secret" ]]; then
		selected_file="$( (
			fdfind --type f . ~/.microsoft/usersecrets/
		) | fzf)"
		if [[ -f $selected_file ]]; then
			code $selected_file
		fi
	elif [[ "$cmd" == "clone" ]]; then
		shift
		git clone --config credential.helper=\"store\" "$@"
	elif [[ "$cmd" == "foreach-repo" ]]; then
		shift
		"$HOME/foreach-repo.sh" "$@"
	else
		[[ -n "$cmd" ]] && echo "unknown command '$cmd'"
		echo "Available commands: build, cd, clone, foreach-repo, secret"
		return 1
	fi
}
# tab completion
complete -W "build cd code clone foreach-repo secret" exampleFunctionName