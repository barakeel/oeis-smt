;; sequence(s): A306279
;; terms: 3 18 25 40 47 62 69 84 91 106 113 128 135 150 157 172 179 194 201 216
;; small program: ((loop(((2 + y) * x) + (x mod 2), 2, x) - x) + 1) + 2
;; fast program: 1 + (2 + ((2 * ((2 * (((x mod 2) + x) + x)) + x)) + x))
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (* (+ 2 y) x) (modf x 2)))))
(assert (= g0 2))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (+ (+ (- (v0 x) x) 1) 2))))
(assert (forall ((x Int)) (= (fast x) (+ 1 (+ 2 (+ (* 2 (+ (* 2 (+ (+ (modf x 2) x) x)) x)) x))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
