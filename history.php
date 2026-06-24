<?php 
require_once 'dbconnect.php'; 

$limit = 10; 
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
if ($page < 1) $page = 1;
$offset = ($page - 1) * $limit;

$total_result = $conn->query("SELECT COUNT(*) as count FROM transactions")->fetch_assoc();
$total_pages = ceil($total_result['count'] / $limit);

$query = "SELECT t.*, 
            GROUP_CONCAT(CONCAT(p.name, ' (x', ti.quantity, ')') SEPARATOR ', ') as items 
          FROM transactions t 
          LEFT JOIN transaction_items ti ON t.transaction_id = ti.transaction_id 
          LEFT JOIN products p ON ti.product_id = p.product_id 
          GROUP BY t.transaction_id 
          ORDER BY t.transaction_date DESC 
          LIMIT $limit OFFSET $offset";
$result = $conn->query($query);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Ice Pop POS | History</title>
</head>
<body class="bg-slate-50 text-slate-800 antialiased p-6 md:p-12">
    
    <div class="max-w-6xl mx-auto">
        <header class="flex justify-between items-center mb-10 pb-6 border-b border-slate-200/60">
            <div>
                <h1 class="text-3xl font-extrabold text-pink-500 tracking-tight">Transaction History</h1>
                <p class="text-slate-400 text-sm mt-1 font-medium">Review past sales records</p>
            </div>
            <div class="flex gap-2">
                <a href="products.php" class="inline-flex items-center gap-2 bg-slate-100 hover:bg-pink-50 text-slate-600 hover:text-pink-600 font-bold px-4 py-2.5 rounded-xl text-xs transition-all tracking-wide border border-slate-200/40 hover:border-pink-200/60 shadow-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" stroke="currentColor" class="w-4 h-4">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5L3 12m0 0l7.5-7.5M3 12h18" />
                    </svg>
                    Back to Inventory
                </a>
            </div>
        </header>

        <div class="bg-white rounded-2xl border border-slate-200/60 shadow-sm overflow-hidden">
            <table class="w-full text-left border-collapse">
                <thead class="bg-slate-50/70 text-slate-400 text-xs uppercase tracking-wider border-b border-slate-100">
                    <tr>
                        <th class="p-4 font-bold">Receipt #</th>
                        <th class="p-4 font-bold">Date & Time</th>
                        <th class="p-4 font-bold">Customer</th>
                        <th class="p-4 font-bold">Items Sold</th>
                        <th class="p-4 font-bold text-right">Total Amount</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-slate-100">
                    <?php if ($result->num_rows > 0): ?>
                        <?php while ($row = $result->fetch_assoc()): ?>
                        <tr class="hover:bg-slate-50/50 transition text-sm">
                            <td class="p-4 font-mono font-bold text-slate-600">#<?= str_pad($row['transaction_id'], 6, "0", STR_PAD_LEFT) ?></td>
                            <td class="p-4 text-slate-500">
                                <?= date("Y-m-d h:i A", strtotime($row['transaction_date'])) ?>
                            </td>
                            <td class="p-4 font-medium text-slate-700"><?= !empty($row['customer_name']) ? htmlspecialchars($row['customer_name']) : '<span class="text-slate-300 italic">N/A</span>' ?></td>
                            <td class="p-4 text-slate-600 text-xs max-w-md truncate"><?= htmlspecialchars($row['items']) ?></td>
                            <td class="p-4 text-right font-bold text-pink-600 font-mono"><?= number_format($row['total_amount']) ?> MMK</td>
                        </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr>
                            <td colspan="5" class="p-10 text-center text-slate-400 text-xs font-medium italic">
                                No transaction records available.
                            </td>
                        </tr>
                    <?php endif; ?>
                </tbody>
            </table>

            <?php if ($total_pages > 1): ?>
            <div class="px-6 py-4 border-t border-slate-100 flex items-center justify-between bg-slate-50/50">
                <span class="text-xs font-bold text-slate-400 uppercase tracking-wider">Page <?= $page ?> of <?= $total_pages ?></span>
                <div class="flex gap-2">
                    <?php if ($page > 1): ?>
                        <a href="?page=<?= $page - 1 ?>" class="px-4 py-2 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-600 hover:border-pink-300 transition shadow-sm">Previous</a>
                    <?php endif; ?>
                    
                    <?php if ($page < $total_pages): ?>
                        <a href="?page=<?= $page + 1 ?>" class="px-4 py-2 bg-white border border-slate-200 rounded-xl text-xs font-bold text-slate-600 hover:border-pink-300 transition shadow-sm">Next</a>
                    <?php endif; ?>
                </div>
            </div>
            <?php endif; ?>
        </div>
    </div>
</body>
</html>