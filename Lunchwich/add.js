let list = [];
let a = document.getElementById("hidden");

let ingredients = document.querySelectorAll(".falseadd");
ingredients.forEach(ingredients => {
    ingredients.addEventListener("click", function () {
        if (ingredients.className === "falseadd") {
            list.push(this.id);
            console.log(list);
            a.value = list;
            ingredients.className = "trueadd";
        } else {
            let index = list.indexOf(this.id);
            list.splice(index, 1);
            console.log(list);
            a.value = list;a
            ingredients.className = "falseadd";
        }
    })
})
    

let b = document.getElementById("hom");

b.addEventListener("click", function () {
  window.location.href = "http://localhost/index.php";
});

let c = document.getElementById("addbutton");
