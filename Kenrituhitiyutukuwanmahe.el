(require 'dash)
(require 'f)

;; (f--files "." (equal (f-ext it) "el"))

(defun kh-prev-item (index list)
    "returns the prev item the item you order in the list."
    (-first-item (kh-prev-phalanx index list)))

(defun kh-next-item (index list)
    "returns the prev item the item you order in the list."
    (-first-item (kh-next-phalanx index list)))

(defun kh-n-next-item (index n list)
    "returns the n-next item of the item you order."
    (-first-item (kh-n-next-phalanx index n list)))

(defun kh-phalanx (index list)
    "returns the list whose first item is what you order."
    (-rotate (- index) list))

(defun kh-prev-phalanx (index list)
    "returns the list whose first item is prev of what you order."
    (-rotate (+ (- index) 1) list))

(defun kh-next-phalanx (index list)
    "returns the list whose first item is next of what you order."
    (-rotate (+ (- index) -1) list))

(defun kh-n-next-phalanx (index list)
    "returns the list whose first item is next of what you order."
    (-rotate (+ (- index) (- n)) list))

(defun kh-current-file-index (ext)
    (let*
        (
            (list (f--files "." (equal (f-ext it) ext)))
            (file (f-this-file)))
        (-elem-index file list)))

(defun kh-prev-file (ext)
    (let*
        (
            (index (kh-current-file-index ext))
            (list (f--files "." (equal (f-ext it) ext)))
            (prev-file (kh-prev-item index list)))
        prev-file))

(defun kh-next-file (ext)
    (let*
        (
            (index (kh-current-file-index ext))
            (list (f--files "." (equal (f-ext it) ext)))
            (next-file (kh-next-item index list)))
        next-file))

(defun kh-n-next-file (ext n)
    (let*
        (index (kh-current-file-index ext))
        (list (f--files "." (equal (f-ext it) ext)))
        (n-next-file (kh-n-next-item index n list))))


(defun kh-find-prev-file (ext)
    (interactive)
    (kh-find-n-next-file -1 ext))

(defun kh-find-next-file (ext)
    (interactive)
    (kh-find-n-next-file 1 ext))

(defun kh-find-n-next-file (n ext)
    (interactive)
    (find-file (kh-n-next-file n ext)))

(provide 'Kenrituhitiyutukuwanmahe)
