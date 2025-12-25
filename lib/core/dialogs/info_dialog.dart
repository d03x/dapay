import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? btnCancelText;
  final String? btnOkText;
  final VoidCallback? onConfirm;

  const InfoDialog({
    super.key,
    required this.title,
    required this.message,
    this.btnCancelText,
    this.btnOkText,
    this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    // Akses tema warna & text style
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // PERBAIKAN: Gunakan 'surface' untuk background container
          color: colors.surface,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              // PERBAIKAN: Gunakan shadow color bawaan tema agar pas di dark mode
              color: colors.shadow.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 1. Icon Besar dengan Background
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                // PERBAIKAN: Gunakan 'errorContainer' untuk background yang lebih soft
                color: colors.errorContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 40,
                // PERBAIKAN: Gunakan 'error' atau 'onErrorContainer' untuk ikon
                color: colors.error,
              ),
            ),
            const SizedBox(height: 20),

            // 2. Judul
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                // PERBAIKAN: Teks di atas surface warnanya 'onSurface'
                color: colors.onSurface,
              ),
            ),
            const SizedBox(height: 10),

            // 3. Pesan
            Text(
              message,
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                // PERBAIKAN: Gunakan variant untuk teks sekunder (abu-abu otomatis)
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 25),

            // 4. Tombol Aksi
            Row(
              children: [
                // Tombol Batal
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // Border mengikuti warna outline tema
                      side: BorderSide(color: colors.outline),
                    ),
                    child: Text(
                      btnCancelText ?? "Batal",
                      style: TextStyle(
                        // Warna teks mengikuti warna utama teks (hitam/putih)
                        color: colors.onSurface,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Tombol Konfirmasi (Coba Lagi / OK)
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Tutup dialog dulu
                      if (onConfirm != null) onConfirm!(); // Jalankan aksi
                    },
                    style: ElevatedButton.styleFrom(
                      // Background merah (error)
                      backgroundColor: colors.error,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      btnOkText ?? "Coba Lagi",
                      style: TextStyle(
                        // Teks di atas warna error harusnya 'onError' (biasanya putih)
                        color: colors.onError,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper static function diperbarui
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    String? btnOkText,
    String? btnCancelText,
    VoidCallback? onConfirm,
  }) {
    showDialog(
      useSafeArea: true,
      fullscreenDialog: true,
      context: context,
      builder: (_) => InfoDialog(
        title: title,
        message: message,
        btnOkText: btnOkText,
        btnCancelText: btnCancelText,
        onConfirm: onConfirm,
      ),
    );
  }
}
