;; sequence(s): A330197
;; terms: 0 0 0 12 14 32 54 80 110 168 208 280 360 448 544 684 798 960 1134 1320
;; small program: ((((x * x) div (1 + 2)) + (x mod 2)) div 2) * (1 + (2 + x))
;; fast program: (((1 + (2 + (x * x))) div (2 * (2 + (2 + 2)))) * (x + (1 + 2))) * 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (* (divf (+ (divf (* x x) (+ 1 2)) (modf x 2)) 2) (+ 1 (+ 2 x))))))
(assert (forall ((x Int)) (= (fast x) (* (* (divf (+ 1 (+ 2 (* x x))) (* 2 (+ 2 (+ 2 2)))) (+ x (+ 1 2))) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
