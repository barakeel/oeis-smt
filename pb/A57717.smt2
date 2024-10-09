;; sequence(s): A57717
;; terms: 0 2 3 4 5 6 7 8 9 11 12 13 14 15 16 17 18 19 20 21
;; small program: x - ((0 - x) div (2 + (2 + (x div 2))))
;; fast program: (if (x - (2 * (2 + 2))) <= 0 then (if x <= 0 then 0 else 1) else 2) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (- x (divf (- 0 x) (+ 2 (+ 2 (divf x 2))))))))
(assert (forall ((x Int)) (= (fast x) (+ (ite (<= (- x (* 2 (+ 2 2))) 0) (ite (<= x 0) 0 1) 2) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
