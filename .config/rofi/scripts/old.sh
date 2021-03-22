#!/bin/bash
MY_PATH=/home/aethan/.config/rofi/scripts
export CUR_DIR=$PWD
function icon_file_type(){
    file_name="$1"
	icon_name=""
	mime_type=$(file --mime-type -b "${1}")

	case "${mime_type}" in
		"inode/directory")
            file_name="${file_name}/"
			case "${1}" in
				"Desktop/" )
					icon_name='folder-blue-desktop'
					;;
				"Documents/" )
					icon_name='folder-blue-documents'
					;;
				"Downloads/" )
					icon_name='folder-blue-downloads'
					;;
				"Music/" )
					icon_name='folder-blue-music'
					;;
				"Pictures/" )
					icon_name='folder-blue-pictures'
					;;
				"Public/" )
					icon_name='folder-blue-public'
					;;
				"Templates/" )
					icon_name='folder-blue-templates'
					;;
				"Videos/" )
					icon_name='folder-blue-videos'
					;;
				"root/" )
					icon_name='folder-root'
					;;
				"home/" | "${USER}/")
					icon_name='folder-home'
					;;
				*"$" )
					icon_name='folder-blue'
					;;
				*)
					icon_name='folder-blue'
					;;
			esac
		;;
		"inode/symlink" )
			icon_name='inode-symlink'
			;;
		"audio/flac" | "audio/mpeg" )
			icon_name='music'
			;;
		"video/mp4" )
			icon_name='video-mp4'
			;;
		"video/x-matroska" )
			icon_name=video-x-matroska
			;;
		"image/x-xcf" )
			# notify-send '123'
			icon_name='image-x-xcf'
			;;
		"image/jpeg" | "image/png" | "image/svg+xml")
			icon_name="${CUR_DIR}/${1}"
			;;
		"image/gif" )
			icon_name='gif'
			;;
		"image/vnd.adobe.photoshop" )
			icon_name='image-vnd.adobe.photoshop'
			;;
		"image/webp" )
			icon_name='gif'
			;;
		"application/x-pie-executable" )
			icon_name='binary'
			;;
		"application/pdf" )
			icon_name='pdf'
			;;
		"application/zip" )
			icon_name='application-zip'
			;;
		"application/x-xz" ) 
			icon_name='application-x-xz-compressed-tar'
			;;
		"application/x-7z-compressed" )
			icon_name='application-x-7zip'
			;;
		"application/x-rar" )
			icon_name='application-x-rar'
			;;
		"application/octet-stream" | "application/x-iso9660-image" )
			icon_name='application-x-iso'
			;;
		"application/x-dosexec" )
			icon_name='application-x-ms-dos-executable'
			;;
		"text/plain" )
			icon_name='application-text'
			;;
		"text/x-shellscript" )
			icon_name='application-x-shellscript'
			;;
		"font/sfnt" | "application/vnd.ms-opentype" )
			icon_name='application-x-font-ttf'
			;;
		* )
			case "${1}" in
				*."docx" | *".doc" )
					icon_name='application-msword'
					;;
				*."apk" )
					icon_name='android-package-archive'
					;;
				* )
					icon_name='unknown'
					;;
			esac
			;;
	esac

	echo -en "$file_name\0icon\x1f$icon_name\n"
}
export -f icon_file_type

THREADS=$(getconf _NPROCESSORS_ONLN)
for i in $(seq 1 1); do
    fd -Ht d -d 1 -x bash -c 'icon_file_type $1' _ {} \ | sort -V --parallel=$THREADS 
    fd -Ht f -d 1 -x bash -c 'icon_file_type $1' _ {} \ | sort -V --parallel=$THREADS
    # fd -Ht d -d 1 | while IFS= read -r file; do icon_file_type "$file/"; done | sort -V --parallel=$THREADS
    # fd -Ht f -d 1 | while IFS= read -r file; do icon_file_type "$file"; done | sort -V --parallel=$THREADS
    # ls -1Av --file-type --group-directories-first | while IFS= read -r file; do icon_file_type "${file%[=>@|]}"; done
done
