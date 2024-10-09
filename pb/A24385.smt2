;; sequence(s): A24385
;; terms: 0 3 9 16 25 36 49 64 82 101 122 145 170 197 227 258 291 326 363 402
;; small program: ((2 + x) * x) + ((2 + (x div 2)) div (1 + 2))
;; fast program: ((2 + x) * x) - ((1 - x) div (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (* (+ 2 x) x) (divf (+ 2 (divf x 2)) (+ 1 2))))))
(assert (forall ((x Int)) (= (fast x) (- (* (+ 2 x) x) (divf (- 1 x) (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
