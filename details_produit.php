 <?php
require 'connect.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "SELECT * FROM produit WHERE id_produit = $id";
    $result = mysqli_query($cnx, $sql);
    $produit = mysqli_fetch_assoc($result);

    if ($produit) {
        $image = !empty($produit['image']) ? $produit['image'] : 'https://via.placeholder.com/400';
?>
<!DOCTYPE html>
<html lang="fr" class="light">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo htmlspecialchars($produit['nom_produit']); ?> - Détails</title>
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;900&display=swap" rel="stylesheet"/>
</head>
<body class="font-display bg-background-light dark:bg-background-dark text-[#0d1b13] dark:text-gray-200 px-6 py-8">

<div class="max-w-3xl mx-auto bg-white dark:bg-background-dark/80 p-6 rounded-xl shadow-lg">
    <img src="<?php echo $image; ?>" alt="<?php echo htmlspecialchars($produit['nom_produit']); ?>" class="w-full rounded-lg mb-4">
    <h1 class="text-2xl font-bold mb-2"><?php echo htmlspecialchars($produit['nom_produit']); ?></h1>
    <p class="mb-2">Type: <?php echo htmlspecialchars($produit['type de produit']); ?></p>
    <p class="mb-2">Marque: <?php echo htmlspecialchars($produit['marque de produit']); ?></p>
    <p class="font-bold mb-4">Prix: <?php echo htmlspecialchars($produit['prix de produit']); ?> €</p>
    <a href="index.php" class="inline-block px-4 py-2 bg-green-500 text-white rounded hover:bg-green-600">Retour aux produits</a>
</div>

</body>
</html>

<?php
    } else {
        echo "Produit non trouvé.";
    }
} else {
    echo "Aucun produit sélectionné.";
}
?>
