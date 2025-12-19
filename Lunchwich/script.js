let list = [];
let ingredients = document.querySelectorAll(".false");
let knop = document.getElementById("knop");

ingredients.forEach(ingredients => {
    ingredients.addEventListener("click", function () {
        if (ingredients.className === "false") {
            list.push(this.id);
            console.log(list);
            ingredients.className = "true";
        } else {
            let index = list.indexOf(this.id);
            list.splice(index, 1);
            console.log(list);
            ingredients.className = "false";
        }
    })
})



let g = document.getElementById("nextpage");
    g.addEventListener("click", function () {
        if (list.length === 0) {
            alert("No ingredient selected!")
        } else {
            window.location.href = `pagetwo.php?ids=${list}`;
            console.log(list);
        }


    });


