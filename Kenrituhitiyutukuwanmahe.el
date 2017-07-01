(require 'dash)
(require 'f)

;; (f--files "." (equal (f-ext it) "el"))

(defun kh-n-next-item (index n list)
    "returns the n-next item of the item you order."
    (-first-item (kh-n-next-phalanx index n list)))

(defun kh-phalanx (index list)
    "returns the list whose first item is what you order."
    (-rotate (- index) list))

(defun kh-n-next-phalanx (index n list)
    "returns the list whose first item is next of what you order."
    (-rotate (+ (- index) (- n)) list))

(defun kh-current-file-index (ext)
    (let*
        (
            (list (f--files "." (equal (f-ext it) ext)))
            (file (f-this-file)))
        (-elem-index file list)))

(defun kh-n-next-file (n ext)
    (let*
        (
            (index (kh-current-file-index ext))
            (list (f--files "." (equal (f-ext it) ext)))
            (n-next-file (kh-n-next-item index n list)))
        n-next-file))

(defun kh-find-n-next-file (n ext)
    (interactive)
    (find-file (kh-n-next-file n ext)))

(defun kh-find-prev-file (ext)
    (interactive)
    (kh-find-n-next-file -1 ext))

(defun kh-find-next-file (ext)
    (interactive)
    (kh-find-n-next-file 1 ext))

(provide 'Kenrituhitiyutukuwanmahe)
