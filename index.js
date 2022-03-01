const state = {}

function initState() {
    state.files = []
    state.currentScreen = 0

    var form = document.getElementById("upload-box-form")
    form.reset()
}

async function startDownload() {
    var data = await state.files[0].arrayBuffer()
    var blob = new Blob([data], {type: "octet/stream"});
    var url  = window.URL.createObjectURL(blob);
    window.location.assign(url);
}

function handleFormInput() {
    var files = document.getElementById("upload-box-button").files
    setState(() => {
        state.files = []
        for (var i = 0; i < files.length; i++) {
            console.log(files[i])
            state.files.push(files[i])
        }
    })
}

function handleScreens() {
    var screens = document.getElementsByClassName("screen")
    for (var i = 0; i < screens.length; i++) {
        var screen = screens[i]
        screen.style.display = (i == state.currentScreen) ? "" : "none"
    }
}

function handleFiles() {
    var boxes = document.getElementsByClassName("upload-box-inner")
    boxes[0].style.display = state.files.length == 0 ? "" : "none"
    boxes[1].style.display = state.files.length != 0 ? "" : "none"

    if (state.files.length > 0) {
        var box = boxes[1]
        box.innerHTML=""
        for (var i = 0; i < state.files.length; i++) {
            var p = document.createElement("p")
            p.innerHTML = state.files[i].name
            p.classList.add("file")
            box.appendChild(p)
        }

        var b = document.createElement("a")
        b.href = "#"
        b.download = "result.pdf"
        b.classList.add("download-btn")
        b.onclick = startDownload
        b.innerHTML = "Download"
        box.appendChild(b)
    }
    
}

function build() {
    handleScreens()
    handleFiles()
}

function setState(callback) {
    callback()
    build()
}



function dropHandler(ev) {
    console.log('File(s) dropped');

    // Prevent default behavior (Prevent file from being opened)
    ev.preventDefault();

    if (ev.dataTransfer.items) {
        // Use DataTransferItemList interface to access the file(s)
        for (var i = 0; i < ev.dataTransfer.items.length; i++) {
            // If dropped items aren't files, reject them
            if (ev.dataTransfer.items[i].kind === 'file') {
                var file = ev.dataTransfer.items[i].getAsFile();
                console.log('... file[' + i + '].name = ' + file.name);

                setState(() => {
                    state.files.push(ev.dataTransfer.items[i].getAsFile())
                })
                
            }
        }
    } else {
        // Use DataTransfer interface to access the file(s)
        for (var i = 0; i < ev.dataTransfer.files.length; i++) {
            console.log('... file[' + i + '].name = ' + ev.dataTransfer.files[i].name);

            setState(() => {
                state.files.push(ev.dataTransfer.files[i])
            })
        }
    }
}

function dragOverHandler(ev) {
    console.log('File(s) in drop zone');

    // Prevent default behavior (Prevent file from being opened)
    ev.preventDefault();
}

initState()
build()