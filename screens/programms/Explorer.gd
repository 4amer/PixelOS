extends Window

var search_line

# Called when the node enters the scene tree for the first time.
func _ready():
	search_line = $UI/Content/Search


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# HOME
func _on_home_button_down():
	search_line.text = "C:/" + "home"

# DOCUMENTS
func _on_documents_button_down():
	search_line.text = "C:/" + "documents"

# DOWNLOADS
func _on_downloads_button_down():
	search_line.text = "C:/" + "downloads"

#MUSIC
func _on_music_button_down():
	search_line.text = "C:/" + "music"

#PICTURES
func _on_pictures_button_down():
	search_line.text = "C:/" + "pictures"

#VIDEOS
func _on_videos_button_down():
	search_line.text = "C:/" + "videos"


func _on_close_requested():
	get_tree().queue_delete(self)
