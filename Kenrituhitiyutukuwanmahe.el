(require 'dash)
(require 'f)

;; (f--files "." (equal (f-ext it) "el"))

(defun kh-prev-item (index list)
    "returns the prev item the item you order in the list."
    (-first-item (kh-prev-phalanx index list)))

(defun kh-next-item (index list)
    "returns the prev item the item you order in the list."
    (-first-item (kh-next-phalanx index list)))

(defun kh-phalanx (index list)
    "returns the list whose first item is what you order."
    (-rotate (- index) list))

(defun kh-prev-phalanx (index list)
    "returns the list whose first item is prev of what you order."
    (-rotate (+ (- index) 1) list))

(defun kh-next-phalanx (index list)
    "returns the list whose first item is next of what you order."
    (-rotate (+ (- index) -1) list))

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

(defun kh-find-prev-file (ext)
    (interactive)
    (find-file (kh-prev-file ext)))

(defun kh-find-next-file (ext)
    (interactive)
    (find-file (kh-next-file ext)))

(defun kh-find-prev-file-ksu ()
    (interactive)
    (kh-find-prev-file "shell"))

(defun kh-find-next-file-ksu ()
    (interactive)
    (kh-find-next-file "shell"))

(provide 'Kenrituhitiyutukuwanmahe)
