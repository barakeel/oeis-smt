;; sequence(s): A147685
;; terms: 0 1 1 5 4 13 9 25 16 41 25 61 36 85 49 113 64 145 81 181
;; small program: (1 + ((x div (2 - (x mod 2))) * x)) div 2
;; fast program: (1 + (x * x)) div (2 * (2 - (x mod 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ 1 (* (divf x (- 2 (modf x 2))) x)) 2))))
(assert (forall ((x Int)) (= (fast x) (divf (+ 1 (* x x)) (* 2 (- 2 (modf x 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
