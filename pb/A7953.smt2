;; sequence(s): A7953-A76314-A80463
;; terms: 0 1 2 3 4 5 6 7 8 9 1 2 3 4 5 6 7 8 9 10
;; small program: ((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))
;; fast program: x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (+ (divf (divf x 2) (+ 1 (+ 2 2))) (modf x (+ 2 (* 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (fast x) (- x (* (+ 1 (* 2 (+ 2 2))) (divf x (+ 2 (* 2 (+ 2 2)))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
