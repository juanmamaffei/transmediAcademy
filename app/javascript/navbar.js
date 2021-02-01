// Eventos para la barra de navegación

const evento = document.addEventListener('turbolinks:load', () => {
    // #hamburguesa y #menu_hamburguesa
    document.getElementById('hamburguesa').addEventListener('click', ()=>{
        document.getElementById('menu_avatar').classList.toggle("hidden");
    })
    
    // #campanita
    document.getElementById('campanita').addEventListener('click', ()=>{
       // console.log("tocaste la campanita")
    })

    // #avatar y #menu_avatar
    document.getElementById('user-menu').addEventListener('click', ()=>{
        document.getElementById('menu_perfil').classList.toggle("hidden");
    })
});