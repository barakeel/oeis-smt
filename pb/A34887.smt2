;; sequence(s): A34887
;; terms: 1 1 1 1 2 2 2 3 3 3 4 4 4 4 5 5 5 6 6 6
;; small program: 1 + (((x div 2) + x) div (1 + (2 + 2)))
;; fast program: 1 + (((x + x) + x) div (2 + (2 * (2 + 2))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ 1 (divf (+ (divf x 2) x) (+ 1 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (divf (+ (+ x x) x) (+ 2 (* 2 (+ 2 2))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
