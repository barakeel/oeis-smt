;; sequence(s): A168378
;; terms: 3 11 11 19 19 27 27 35 35 43 43 51 51 59 59 67 67 75 75 83
;; small program: loop(1 + (x + x), 2, (x mod 2) + x)
;; fast program: 1 + (2 + (2 * (2 * ((x mod 2) + x))))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (+ x x)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) (+ (modf x 2) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (* 2 (* 2 (+ (modf x 2) x))))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
