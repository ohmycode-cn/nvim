#!/bin/bash

if [[ "${0}" != "${BASH_SOURCE[0]}" ]]; then
	FILE_NAME="${BASH_SOURCE[0]##*/}"
	echo -e "Error: Right usage: bash ${FILE_NAME} [options]"
	exit 1
fi

LOG_FILE_TYPE=".txt"
LOG_FILE_PATH="log/"

function lock_log_files() {
	echo -e "Info : Executting lock log file ${LOG_FILE_PATH}"
	if ! chmod u-w "${LOG_FILE_PATH}"*"${LOG_FILE_TYPE}"; then
		echo -e "Error: Lock log file failed !"
		return 1
	fi
	echo -e "Info : OK"
	return 0
}

function unlock_log_files() {
	echo -e "Info : Executting unlock log file ${LOG_FILE_PATH}"
	if ! chmod u+w "${LOG_FILE_PATH}"*"${LOG_FILE_TYPE}"; then
		echo -e "Error: Unlock log file failed !"
		return 1
	fi
	echo -e "Info : OK"
	return 0
}

function main() {
	local param="${1}"
	local status_code

	if [[ -z "${param}" || "lock" == "${param}" ]]; then
		if [[ -z "${param}" ]]; then
			echo -e "Warn : You not provide param lock/unlock, default lock log file"
		fi
		lock_log_files; status_code=$?
	elif [[ "unlock" == "${param}" ]]; then
		unlock_log_files; status_code=$?
	else
		echo -e "Error: unknown handle"
		status_code=1
	fi

	return "${status_code}"
}

main "${1}"
exit $?
