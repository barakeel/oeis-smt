;; sequence(s): A180592
;; terms: 0 2 4 6 8 1 3 5 7 9 2 4 6 8 1 3 5 7 9 2
;; small program: loop(1 + (x mod (1 + (2 * (2 + 2)))), x, x)
;; fast program: ((((x - 1) + x) mod (1 + (2 * (2 + 2)))) + 1) * (if x <= 0 then 0 else 1)
(set-logic UFNIA)
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (modf x (+ 1 (* 2 (+ 2 2))))))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (fast x) (* (+ (modf (+ (- x 1) x) (+ 1 (* 2 (+ 2 2)))) 1) (ite (<= x 0) 0 1)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
