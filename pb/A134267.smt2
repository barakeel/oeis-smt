;; sequence(s): A134267
;; terms: 3 2 3 2 5 2 3 2 5 2 3 2 5 2 3 2 5 2 3 2
;; small program: loop((((x * y) - x) mod (2 + 2)) + 1, x, 2) + 1
;; fast program: (((1 + (if x <= 0 then 0 else (2 + (x * x)))) * (1 + x)) mod (2 + 2)) + 2
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (modf (- (* x y) x) (+ 2 2)) 1))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 2))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (+ (v0 x) 1))))
(assert (forall ((x Int)) (= (fast x) (+ (modf (* (+ 1 (ite (<= x 0) 0 (+ 2 (* x x)))) (+ 1 x)) (+ 2 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
