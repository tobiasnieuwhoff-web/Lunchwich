let lis2 = [];
let ingredients = document.querySelectorAll(".false");
ingredients.forEach(ingredients => {
    ingredients.addEventListener("click", function () {
        if (ingredients.className === "false") {
            lis2.push(this.id);
            console.log(lis2);
            ingredients.className = "true";
        } else {
            let index = lis2.indexOf(this.id);
            lis2.splice(index, 1);
            console.log(lis2);
            ingredients.className = "false";
        }
    })
})


let g = document.getElementById("lastpage");
g.addEventListener("click", function () {

    if (lis2.length === 0) {
    window.location.href = `finalpage.php?ids=${lis2}`;

    } else {
        window.location.href = `finalpage.php?ids=${lis2}`;
    }

});

let a = document.getElementById("hom");

    a.addEventListener("click", function () {
        location.replace("http://localhost/index.php")
})