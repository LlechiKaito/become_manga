function empty_add(){
    const empty = document.createElement('div');
    empty.classList.add('box_empty');
    const parent = document.getElementById('wrapper');
    for(let i = 0; i < 5; i++)
    {
        parent.appendChild(empty.cloneNode(true));
    }
}

window.addEventListener('load',empty_add);