function toggleSidebar() {
    if (document.body.className.includes("sidebar-collapse")) {
        document.body.className = document.body.className.replace("sidebar-collapse", "").trim();
    }
    else {
        document.body.className = document.body.className.trim().concat(" sidebar-collapse");
    }
}