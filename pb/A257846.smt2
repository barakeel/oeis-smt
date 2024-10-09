;; sequence(s): A257846
;; terms: 0 0 0 0 0 0 0 1 2 3 4 5 0 2 4 6 8 10 0 3
;; small program: ((x div 2) div (1 + 2)) * (x mod (2 + (2 + 2)))
;; fast program: (x div (2 + (2 + 2))) * (x mod (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (divf (divf x 2) (+ 1 2)) (modf x (+ 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (fast x) (* (divf x (+ 2 (+ 2 2))) (modf x (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
