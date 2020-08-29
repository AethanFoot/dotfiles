SHOW_HIDDEN=true

function icon_file_type(){
	icon_name=""
	mime_type=$(file --mime-type -b "${1}")

	case "${mime_type}" in
		"inode/directory" )
			case "${1}" in
				"Desktop/" )
					icon_name='folder-desktop'
					;;
				"Documents/" )
					icon_name='folder-documents'
					;;
				"Downloads/" )
					icon_name='folder-downloads'
					;;
				"Music/" )
					icon_name='folder-music'
					;;
				"Pictures/" )
					icon_name='folder-pictures'
					;;
				"Public/" )
					icon_name='folder-public'
					;;
				"Templates/" )
					icon_name='folder-templates'
					;;
				"Videos/" )
					icon_name='folder-videos'
					;;
				"root/" )
					icon_name='folder-root'
					;;
				"home/" | "${USER}/")
					icon_name='folder-home'
					;;
				*"$" )
					icon_name='folder'
					;;
				*)
					icon_name='folder'
					;;
			esac
		;;
		"inode/symlink" )
			icon_name='emblem-symbolic-link'
			;;
		"audio/flac" | "audio/mpeg" )
			icon_name='audio-flac'
			;;
		"video/mp4" )
			icon_name='video-mp4'
			;;
		"video/x-matroska" )
			icon_name='video-x-matroska'
			;;
		"image/x-xcf" )
			icon_name='image-x-xcf'
			;;
		"image/jpeg" | "image/png" | "image/svg+xml")
			icon_name='image-jpeg'
			;;
		"image/gif" )
			icon_name='image-gif'
			;;
		"image/vnd.adobe.photoshop" )
			icon_name='image-vnd.adobe.photoshop'
			;;
		"image/webp" )
			icon_name='image-gif'
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
			icon_name='application-x-7z-compressed'
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
			icon_name='text-plain'
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

	echo -en "$1\0icon\x1f$icon_name\n"
}

if [[ ${SHOW_HIDDEN} = true ]]; then
	for i in .*/; do 
        [[ -d "${i}" ]] && [[ "${i}" != "./" ]] && [[ "${i}" != "../"* ]] && icon_file_type "${i}"
    done
fi

for i in */; do [[ -d "${i}" ]] && icon_file_type "${i}"; done

if [[ ${SHOW_HIDDEN} = true ]]; then
	for i in .*; do 
		[[ -f "${i}" ]] && icon_file_type "${i}"
	done
fi

for i in *; do [[ -f "${i}" ]] && icon_file_type "${i}";done


