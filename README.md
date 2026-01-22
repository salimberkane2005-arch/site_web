<?php
session_start();
require 'connect.php';

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

// Supprimer un produit
if (isset($_GET['remove'])) {
    unset($_SESSION['cart'][$_GET['remove']]);
    header("Location: client.php");
    exit;
}

$total = 0;
?>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Mon Panier</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
<h2 class="mb-4">🛒 Mon Panier</h2>

<?php if (empty($_SESSION['cart'])): ?>
  <div class="alert alert-warning">Votre panier est vide.</div>
<?php else: ?>

<table class="table table-bordered">
<tr>
  <th>Produit</th>
  <th>Prix</th>
  <th>Quantité</th>
  <th>Total</th>
  <th>Action</th>
</tr>

<?php foreach ($_SESSION['cart'] as $id => $qty):
  $sql = "SELECT * FROM produit WHERE id_produit=$id";
  $res = mysqli_query($cnx, $sql);
  $p = mysqli_fetch_assoc($res);

  $subtotal = $p['prix de produit'] * $qty;
  $total += $subtotal;
?>

<tr>
  <td><?php echo $p['nom_produit']; ?></td>
  <td><?php echo $p['prix de produit']; ?> DA</td>
  <td><?php echo $qty; ?></td>
  <td><?php echo $subtotal; ?> DA</td>
  <td>
    <a href="client.php?remove=<?php echo $id; ?>" class="btn btn-danger btn-sm">
      Supprimer
    </a>
  </td>
</tr>

<?php endforeach; ?>
</table>

<h4 class="text-end">Total : <span class="text-danger"><?php echo $total; ?> DA</span></h4>

<a href="produit.php" class="btn btn-secondary mt-3">← Continuer mes achats</a>

<?php endif; ?>

</div>
</body>
</html>
