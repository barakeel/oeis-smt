;; sequence(s): A275496
;; terms: 0 1 36 153 528 1225 2628 4753 8256 13041 20100 29161 41616 56953 77028 101025 131328 166753 210276 260281
;; small program: loop(x + y, (2 * (x * x)) - (x mod 2), 0)
;; fast program: (1 + (2 * ((x * x) - (x mod 2)))) * (x * x)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ x y))))
(assert (forall ((x Int)) (= (g0 x) (- (* 2 (* x x)) (modf x 2)))))
(assert (= h0 0))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ 1 (* 2 (- (* x x) (modf x 2)))) (* x x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
