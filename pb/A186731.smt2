;; sequence(s): A186731
;; terms: 0 0 1 2 1 2 4 2 3 6 3 4 8 4 5 10 5 6 12 6
;; small program: ((if (x mod (1 + 2)) <= 0 then x else 1) + x) div (1 + 2)
;; fast program: (loop(1, x mod (1 + 2), x) + x) div (1 + 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun f0 () Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (divf (+ (ite (<= (modf x (+ 1 2)) 0) x 1) x) (+ 1 2)))))
(assert (= f0 1))
(assert (forall ((x Int)) (= (g0 x) (modf x (+ 1 2)))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y f0))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (+ (v0 x) x) (+ 1 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
