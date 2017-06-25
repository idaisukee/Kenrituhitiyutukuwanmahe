(require 'dash)

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

(defun kh-current-file-index ()
    (let*
        (
            (list (f-files "."))
            ;;            (file (->> (f-this-file) f-filename)))
            (file (f-this-file)))
        (-elem-index file list)))
        
(defun kh-prev-file ()
    (let*
        (
            (index (kh-current-file-index))
            (list (f-files "."))
            (dir (->> (f-this-file) f-dirname))
            (prev-file (kh-prev-item index list)))
        prev-file))

(defun kh-next-file ()
    (let*
        (
            (index (kh-current-file-index))
            (list (f-files "."))
            (dir (->> (f-this-file) f-dirname))
            (next-file (kh-next-item index list)))
        next-file))

(provide 'Kenrituhitiyutukuwanmahe)