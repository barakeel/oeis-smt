;; sequence(s): A92907
;; terms: 0 1 2 3 4 5 6 7 8 9 100 101 102 103 104 105 106 107 108 109
;; small program: compr(((x div 2) div (1 + (2 + 2))) mod (2 + (2 * (2 + 2))), x)
;; fast program: ((1 + 2) * ((1 + 2) * (x - (x mod (2 + (2 * (2 + 2))))))) + x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun t0 (Int) Int)
(declare-fun u0 (Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (modf (divf (divf x 2) (+ 1 (+ 2 2))) (+ 2 (* 2 (+ 2 2)))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (t0 x) (ite (<= (f0 x) 0) x (t0 (+ x 1))))))
(assert (forall ((x Int)) (= (u0 x) (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ (* (+ 1 2) (* (+ 1 2) (- x (modf x (+ 2 (* 2 (+ 2 2))))))) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
